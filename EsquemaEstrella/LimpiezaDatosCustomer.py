from sqlalchemy import create_engine
import pandas as pd

engine = create_engine('sqlite:///DW_Northwind.sqlite')
engine

df = pd.read_sql_query("""SELECT * FROM dim_Customer
    
    """, con=engine.connect())

df.head()

df1 = df.fillna('N/A')

df1.to_sql("dim_Customer", engine, if_exists='replace', index=False)

print(df1.head())