# Start with a python base image
FROM python:3.11.9-bookworm 

# Set the working directory
WORKDIR /app

# Latest Versions of Libraries as of Aug 10, 2024
# numpy==2.0.1 (Jul 21, 2024), numpy==1.26.4 (Feb 5, 2024)
# pandas==2.2.2 (Apr 10, 2024)
# matplotlib==3.9.1.post1 (Aug 6, 2024)
# ipython==8.26.0 (Jun 28, 2024)
# gymnasium==0.29.1 (Aug 21, 2023)
# stable-baselines3==2.3.2 (Apr 27, 2024)
# sb3_contrib==2.3.0 (Mar 31, 2024)
# tensorflow==2.17.0 (Jul 11, 2024)
# keras-tcn==3.5.0 (Sep 21, 2022)

RUN pip install --no-cache-dir \
    numpy==1.26.4 \
    pandas==2.2.2 \
    matplotlib==3.9.1.post1 \
    ipython==8.26.0 \
    gymnasium==0.29.1 \
    stable-baselines3[extra]==2.3.2 \
    sb3_contrib==2.3.0 \
    tensorflow==2.15.0
RUN pip install --no-cache-dir --no-dependencies keras-tcn==3.5.0 

# Copy relevant files to Docker image
COPY ./CardiovascularEnv.py /app/
COPY ./reinforcement_training_reworked.py /app/
COPY ./model.h5 /app/
COPY ./ppo_cardiovascular.zip /app/
