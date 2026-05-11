@echo off
REM Run this after downloading FASTQ files and installing requirements.
python src\quality_control.py --input data --output results\custom_qc_summary.csv
python src\feature_extraction.py --fastp-dir results\fastp --metadata sample_metadata.csv --output results\fastp_features.csv
python src\kmer_extraction.py --input data --metadata sample_metadata.csv --k 3 --output results\kmer_features.csv
python src\build_features.py --fastp results\fastp_features.csv --kmers results\kmer_features.csv --output results\features.csv
python src\ml_model.py --features results\features.csv
pause
