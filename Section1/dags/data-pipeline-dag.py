from Data_Pipelines import process_data
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

args = {
    'owner': 'Siti Salihah',
    'start_date': datetime(2022, 8, 4, 17, 31, 30) # make start date in the past
}

#defining the dag object
dag = DAG(
    dag_id='data-pipeline-dag',
    default_args=args,
    schedule_interval='1 1 * * *' #to make this workflow happen every day
)

#assigning the task for our dag to do
with dag:
    hello_world = PythonOperator(
        task_id='process_data',
        python_callable = process_data,
        provide_context=True,
        op_args={'file_path': "../dataset2.csv", 'destination_path': "../processed_dataset2.csv"},
    )