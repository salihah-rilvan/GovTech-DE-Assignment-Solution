SCheduling at 1.01am everyday:

In my ubuntu terminal, I navigated to the folder where my Data_Pipelines.py was placed

I typed:

```
which python3 
```

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

Getting airflow to work with Docker:
https://geekyhumans.com/schedule-python-scripts-with-apache-airflow/#:~:text=Now%20to%20schedule%20Python%20scripts,in%20there%20ending%20with%20a%20.
