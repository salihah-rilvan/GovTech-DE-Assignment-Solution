SCheduling at 1.01am everyday:

In my ubuntu terminal, I navigated to the folder where my Data_Pipelines.py was placed

I typed:

which python3 

to see my where my python3.exe is


Then, I typed:

```
crontab -e
```

Copy pasted this:

```
1 1 * * * /usr/bin/python3  Data_Pipelines.py
```

Then I saved and exited

To check:

```
crontab -l
```

However, I realised that my dataset is still not yet produced in a schedule.

I faced some issues trying to use airflow: especially the part on how to run a dag while parsing in arguments for a python function. I have yet to figure due to time constraint.