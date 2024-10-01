from prefect import flow

@flow
def my_flow():
    print("Hello, Prefect!")

if __name__ == "__main__":
    my_flow.deploy(
        name="k8s-deployment",
        work_pool_name="k8s-pool",
        image="my-image",
        push=False,
        # cron="0 0 * * *",
    )