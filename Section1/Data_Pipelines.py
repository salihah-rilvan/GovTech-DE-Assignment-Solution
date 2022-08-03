import pandas as pd
import numpy as np

def process_data(file_path, destination_path):
    """Function to process data and return a csv file

    Args:
        file_path (str): File path of the original csv dataset.
        destination_path (str): Destination path of where to save 
            the processed csv dataset.
            
    Returns:
        pd.dataFrame: The processed dataframe in the printed form

    """
    
    #Importing the csv file
    df = pd.read_csv(file_path)
    
    #creating a copy of the dataframe
    processed_df = df.copy()
    
    #dropping the rows where there is no name
    processed_df = processed_df.dropna(axis=0, subset=['name'])
    
    #creating a new column called above_100 whereby the price is more than 100
    processed_df['above_100'] = processed_df['price'].apply(lambda x: 'True' if float(x) > 100 else 'False')

    # splitting the name into first_name and last_name
    splitted = df['name'].str.split()
    processed_df['first_name'] = splitted.str[0]
    processed_df['last_name'] = splitted.str[1]
    
    #dropping the old name column
    processed_df.drop('name', axis=1)
    
    #rearrange the column order 
    processed_df = processed_df.reindex(['first_name','last_name','price', 'above_100'], axis=1)
    
    #removing the zeros at the front eg. 0.154 --> .154 
    processed_df['price'] = processed_df['price'].apply(lambda x: str(x).lstrip('0'))
    
    processed_df.to_csv(destination_path, index = False)

    return 



if __name__ == "__main__":
    process_data('dataset2.csv', 'processed_dataset2.csv')
    


#   Refer to this website 
# https://towardsdatascience.com/getting-started-with-apache-airflow-df1aa77d7b1b
# https://airflow.apache.org/docs/apache-airflow/1.10.1/start.html
