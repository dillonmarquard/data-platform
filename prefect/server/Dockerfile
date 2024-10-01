FROM python:3.12.6-slim-bookworm
RUN pip install -U prefect
RUN prefect config set PREFECT_API_URL="http://0.0.0.0:4200/api"
RUN prefect config set PREFECT_SERVER_API_HOST="0.0.0.0"
EXPOSE 4200
CMD ["prefect", "server", "start"]
