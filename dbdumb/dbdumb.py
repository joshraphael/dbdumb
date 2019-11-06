import sqlalchemy
from sqlalchemy import create_engine, MetaData, exc
from dbdumb.click import types
import click
import json
import yaml
from datetime import datetime
import sys

@click.command()
@click.option('-f', '--format', 'format', type=types.Format(), required=True, help='Output format.')
@click.argument('url', type=click.STRING)
def dbdumb(format, url):
    print('in dbdumb')
    try:
        #engine = create_engine("sqlite:////home/user/projects/dbdumb/dbdumb.db", pool_pre_ping=True)
        #engine = create_engine("postgresql://postgres:pgpassword@localhost:5432/dbdumb", pool_pre_ping=True)
        #engine = create_engine("mysql://user:password@127.0.0.1:3306/dbdumb", pool_pre_ping=True)
        engine = create_engine(url, pool_pre_ping=True)
        conn = engine.connect()
    except exc.SQLAlchemyError as e:
        print("ERROR:",e)
        return
    meta = MetaData(None)
    meta.reflect(bind=engine)
    dump = {}
    for table in reversed(meta.sorted_tables):
        cols = []
        for column in table.columns:
            cols = cols + [column.name]
        rs = conn.execute("SELECT %s FROM %s" % (",".join(cols), table.name))
        dump[table.name] = []
        for row in rs:
            r = {}
            for i in range(len(row)):
                if isinstance(row[i], int):
                    r[cols[i]] = row[i]
                else:
                    r[cols[i]] = str(row[i])
            dump[table.name] = dump[table.name] + [r]
    if format == "json":
        print(json.dumps(dump))
    if format == "yaml":
        sys.stdout.write(yaml.dump(yaml.load(json.dumps(dump)), default_flow_style=False))