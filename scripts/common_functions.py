import numpy as np
import os
import pandas as pd
import pymssql
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine, text

def python_setup(font_scale=2, dark_mode=True):
    '''Sets up NEM Review font and palette, and working directories.'''

    # Set departmental font
    sns.set(font="Aptos", font_scale=font_scale, style="white")    
    if dark_mode:
        plt.style.use("dark_background")
    else:
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
    server = os.getenv("GR_SERVER")
    port = os.getenv("GR_PORT")
    database = os.getenv("GR_DATABASE")
    user = os.getenv("GR_USER")
    password = os.getenv("GR_PASSWORD")
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
    
def save_figure(fig, filename, charts_dir):
    """Save a matplotlib figure to the charts directory."""
    fig.savefig(
        os.path.join(charts_dir, f"{filename}.png"),
        bbox_inches="tight",
        dpi=300)
    plt.close(fig)