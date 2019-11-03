import sqlalchemy
from sqlalchemy import create_engine, MetaData
from dbdumb.click import types
import click

@click.command()
@click.option('-f', '--format', 'format', type=types.Format(), required=True, help='Output format.')
def dbdumb(format):
    print('in dbdumb')
    engine = create_engine("sqlite:////home/user/projects/dbdumb/dbdumb.db")
    print(sqlalchemy.__version__)
    print(engine.table_names())
    meta = MetaData(None)
    meta.reflect(bind=engine)
    print(meta.sorted_tables)
    for table in reversed(meta.sorted_tables):
        print(table.columns)