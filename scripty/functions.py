import matplotlib.pyplot as plt, matplotlib as mpl
import numpy as np, os, pandas as pd, seaborn as sns
from sqlalchemy import create_engine, text

def python_setup(font_scale=2):
    '''Sets up NEM Review font and palette, and working directories.'''

    # Set departmental font and palette
    sns.set(font="Aptos", font_scale=font_scale, style="white")
    sns.set_palette(["#05213e", "#1f4994", "#00824e", "#77c267", "#d8e151", "#f7f9ee"])

    # Set working directory
    working_dir = os.getcwd()
    charts_dir = os.path.join(working_dir, "charts")
    data_dir = os.path.join(working_dir, "data")

    return working_dir, charts_dir, data_dir

def get_mms_data(script_name, arguments=None):
    '''Executes SQL query for Global Roam's MMS API.
    Accepts a dictionary of arguments, which are included as parameters.
    Returns the data in a dataframe.'''

    # Database credentials    
    server = os.getenv("DB_SERVER")
    port = os.getenv("DB_PORT")
    database = os.getenv("DB_DATABASE")
    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    database_url = f"mssql+pymssql://{user}:{password}@{server}:{port}/{database}"

    try:
        # Establish connection
        engine = create_engine(database_url)

        # SQL query
        with open(f"./scripts/{script_name}.sql", "r") as sql:
            sql_query = sql.read()

        # Extract and return results
        df = pd.read_sql_query(
            text(sql_query),
            con=engine,
            params=arguments)
        return df

    except Exception as e:
        print(f"Database error occurred: {e}")
        return None