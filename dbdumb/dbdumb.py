import sqlalchemy
from sqlalchemy import create_engine, MetaData, exc
from dbdumb.click import types
import click
import sys

@click.command()
@click.option('-f', '--format', 'format', type=types.Format(), required=True, help='Output format.')
@click.argument('url', type=click.STRING)
def dbdumb(format, url):
    print('in dbdumb')
    try:
        #engine = create_engine("sqlite:////home/user/projects/dbdumb/dbdumb.db", pool_pre_ping=True)
        #engine = create_engine("postgresql://postgres:pgpassword@localhost:5432/dbdumb", pool_pre_ping=True)
        engine = create_engine(url, pool_pre_ping=True)
        engine.connect()
    except exc.SQLAlchemyError as e:
        print("ERROR:",e)
        return
    print(sqlalchemy.__version__)
    print(engine.table_names())
    meta = MetaData(None)
    meta.reflect(bind=engine)
    print(meta.sorted_tables)
    for table in reversed(meta.sorted_tables):
        print(table.columns)