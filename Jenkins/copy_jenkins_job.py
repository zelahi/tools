"""
Name: copy_jenkins_job.py

Description: This script is used to copy a job from one Jenkins to another.

Usage: Create a config.yaml using config.example.yaml as a guide
       Create a csv listing the jobs to copy to another Jenkins instance
       python copyjob.py
"""
import csv
import yaml

from jenkinsapi.jenkins import Jenkins


def get_server_instance(config):
    print "[INFO] Establishing connection to: ", config['url']
    return Jenkins(
        config['url'], username=config['user'], password=config['password'])

def get_jenkins_job_info(server, job_name):
    return server[job_name].get_config()

def copy_job(server, job_config, job_name):
    server.create_job(job_name, job_config)
    
def open_config():
    with open("config.yaml", "r") as stream:
        try:
            config = yaml.safe_load(stream)
            return config            
        except yaml.YAMLError as e:
            print "[ERROR] config.yaml does not exist, please create one"
            raise e
    stream.close()

def get_jobs_to_copy():
    with open('copyjob.csv') as f:
        reader = csv.reader(f)
        return [job for job_list in list(reader) for job in job_list]
    
if __name__ == '__main__':
    jobs_list = get_jobs_to_copy()

    config = open_config()
    base_server = get_server_instance(config['priv'])
    copy_server = get_server_instance(config['new'])

    for job_name in jobs_list:
        job_config = get_jenkins_job_info(base_server, job_name)
        copy_job(copy_server, job_config, job_name)
        print "[INFO] Finished copying: ", job_name
