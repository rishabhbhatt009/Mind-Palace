# Cron 

Time-based **job scheduler** in Unix based systems 
1. **Cron Jobs:** 
	- These are the scheduled tasks that cron executes. 
	- Each cron job is a single line of configuration that specifies when and how often the task should run and what command should be executed.
2. **Crontab (Cron Table):** 
	- configuration file where cron jobs are defined 
	- each line in a crontab file represents a separate job. 
	- users can have their own crontab files, and there's also a system-wide crontab.
3. **Cron Syntax:** The cron job syntax is made up of five fields that represent different time intervals: minute (0-59), hour (0-23), day of the month (1-31), month (1-12), and day of the week (0-7, where both 0 and 7 represent Sunday). After these time fields, the command to be executed is specified.
4. **Daemon:** Cron jobs are managed by the cron daemon, a background process that checks the crontab for jobs to run at the scheduled times.

---
Examples:

```
// min hr dom mon dow
0 5 * * * <command> // run command every day at 5:00 AM.
30 1 * * 1 <command> // run a command at 1:30 AM every Monday.
```    
   
---
Resource :
- [Automatically Schedule Python Scripts with Cron Jobs](https://www.youtube.com/watch?v=2sehQ5oABqI&list=WL&index=4&ab_channel=NeuralNine)
- https://crontab.guru/

---