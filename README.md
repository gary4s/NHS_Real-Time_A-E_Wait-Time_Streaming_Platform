# NHReal‑Time A&E Wait‑Time Streaming Platform
A streaming data engineering project using Terraform, Docker, PySpark, Azure Event Hubs, Prometheus, and Grafana.

## Overview
This project simulates real‑time A&E (Accident & Emergency) patient arrivals and wait‑time events, streams them into Azure Event Hubs, processes them using PySpark Structured Streaming, and visualises both operational and pipeline‑health metrics using Prometheus and Grafana.

It demonstrates a production‑grade streaming architecture with infrastructure‑as‑code, containerised compute, cloud messaging, real‑time analytics, and full observability.

## Key Features
- Synthetic A&E patient event generator (Dockerised Python)
- Real‑time ingestion into Azure Event Hubs
- PySpark Structured Streaming job for processing
- Azure Data Lake Storage (ADLS) Bronze/Silver output
- Terraform‑provisioned Azure resources
- Prometheus metrics scraping from Spark
- Grafana dashboards for:

      A&E operational metrics

      Spark pipeline health

## Architecture

<img width="1177" height="647" alt="image" src="https://github.com/user-attachments/assets/fd87da51-0256-4a11-838a-620a5913dbed" />


Monitoring:
- Prometheus scrapes Spark metrics
- Grafana visualises pipeline + A&E metrics
- 
  ## Event Model
Each event represents a patient arriving or being seen by a doctor.

Arrival event:
json
```
            {
              "patient_id": "P12345",
              "arrival_time": "2026-04-25T05:45:00Z",
              "triage_category": 3,
              "symptoms": "chest pain",
              "age": 62
            }
```
Seen‑by‑doctor event:
json
```
               {
              "patient_id": "P12345",
              "seen_by_doctor_time": "2026-04-25T05:52:00Z"
            }
```

## Streaming Transformations
The PySpark job computes:

Operational Metrics
- Average wait time (last 5 minutes)
- Number of patients currently waiting
- Triage category distribution
- 95th percentile wait time
- Arrival rate per minute

Optional Enhancements
- Anomaly detection (spikes in arrivals)
- Queue length prediction
- SLA breach alerts

## Dashboards
A. A&E Operational Dashboard
- Live average wait time
- Queue length
- Triage category mix
- Arrival throughput
- Alerts for long waits

B. Pipeline Health Dashboard
- Input rows per second
- Batch duration
- Processing latency
- Executor CPU/memory
- Failed batches

## Repository Structure
Code
```
ae-waittime-streaming/
  terraform/
    main.tf
    event_hub.tf
    storage.tf
    variables.tf
    outputs.tf

  docker/
    Dockerfile.spark
    Dockerfile.generator
    prometheus.yml
    grafana/
      provisioning/
        dashboards/
        datasources/

  spark_app/
    streaming_job.py
    metrics.properties

  generator/
    producer.py

  docker-compose.yml
  README.md
```
