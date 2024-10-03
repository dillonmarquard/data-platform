FROM python:3.12.6-slim-bookworm
RUN pip install -U prefect prefect-kubernetes
RUN prefect config set PREFECT_API_URL="http://prefect-service:4200/api"
RUN prefect config set PREFECT_SERVER_API_HOST="prefect-service"
CMD ["prefect", "worker", "start", "--pool", "k8s-pool", "--type","kubernetes"]