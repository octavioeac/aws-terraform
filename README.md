# ML Compute Optimizer

This repository explores different approaches to accelerate and optimize machine learning computations.  
The experiments are designed to compare execution speed and cost across multiple technologies.

## Project Scope
- Python baseline implementations
- CUDA kernels
- PTX low-level programming
- PyTorch training (CPU vs GPU)
- PyTorch optimized with CUDA and PTX
- Deployment and cost analysis on GCP (with Airflow & n8n for orchestration)

## Structure
- `python/` → CPU baseline implementations  
- `cuda/` → CUDA experiments  
- `ptx/` → PTX assembly tests  
- `pytorch/` → Training pipelines with PyTorch  
- `gcp/` → Deployment & orchestration examples  

## Goals
- Benchmark execution times for different implementations
- Measure scalability and cost efficiency
- Document trade-offs between readability, performance, and deployment

## Requirements
- Python 3.10+
- CUDA Toolkit (12.x)
- PyTorch with CUDA support
- Google Cloud SDK (for GCP experiments)

## Next Steps
- Add benchmarks results with plots
- Automate experiments using Airflow
- Publish cost vs performance analysis
