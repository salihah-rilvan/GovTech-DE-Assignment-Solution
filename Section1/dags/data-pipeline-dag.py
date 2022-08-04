from Data_Pipelines import process_data
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.utils.dates import days_ago

args = {
    'owner': 'Siti Salihah',
    'start_date': days_ago(1) # make start date in the past
}

#defining the dag object
dag = DAG(
    dag_id='data-pipeline-dag',
    default_args=args,
    schedule_interval='@daily' #to make this workflow happen every day
)

#assigning the task for our dag to do
with dag:
    hello_world = PythonOperator(
        task_id='hello',
        python_callable = process_data
        # provide_context=True
    )