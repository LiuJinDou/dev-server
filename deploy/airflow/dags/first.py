from datetime import datetime, timedelta
import pendulum
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.decorators import task
# from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator

local_tz=pendulum.timezone('Asia/Shanghai')

with DAG(
    dag_id='local_test',
    schedule_interval='*/5 * * * *',
    start_date=datetime(2024, 6, 25, 12, 0,tzinfo=local_tz),
    concurrency=1,
    catchup=True,
    tags=["local_test"],
    default_args={
        'owner': 'airflow'
    }
) as other_stock_in_dag:
    def test():
        print("test")

    a = test()    
    a

# A DAG represents a workflow, a collection of tasks
with DAG(
    dag_id="demo", 
    start_date=datetime(2024, 7, 1, 12, 0,tzinfo=local_tz),
    schedule_interval="*/5 * * * *",
) as dag:
    # Tasks are represented as operators
    hello = BashOperator(task_id="hello", bash_command="echo hello")

    @task()
    def airflow():
        print("airflow")

    # Set dependencies between tasks
    hello >> airflow()
