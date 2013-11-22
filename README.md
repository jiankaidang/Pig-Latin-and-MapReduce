Pig-Latin-and-MapReduce
=======================

CS9223 - Assignment 2 - Pig Latin and MapReduce

-- Assignment Description --

To get some hands on experience with the pig/latin language and capabilities, you will implement a few different queries -- aggregating content from two different collections. For you to have a better appreciation for the features provided by Pig Latin, you will also implement a join between the two collections we provide using both MapReduce and Pig Latin.

As input you will read from two CSV files that contain descriptions about users and tweets, respectively.

Each line in the user collection contains: login, name and state from a specific user.
Each line in the collection of tweets has the tweet id, content, and a reference to the user who wrote that tweet.

You can find the input files at:
	http://vgc.poly.edu/~juliana/courses/cs9223/Homework/HW2/data/tweets.csv
	http://vgc.poly.edu/~juliana/courses/cs9223/Homework/HW2/data/users.csv


Here are the problems you will solve:

1a. (5 points) Write a Pig Latin query that outputs the login of all users in NY state.

1b. (5 points) Write a Pig Latin query that returns all the tweets that include the word 'favorite', ordered by tweet id.


2a. (15 points) Write a MapReduce program that computes the natural join between the two collections, using the reduce-side join approach.

2b. (15 points) Write the equivalent join using Pig Latin.


3a. (15 points) Write a Pig Latin query that returns the number of tweets for each user name (not login).
You should output one user per line, in the following format:
	user_name, number_of_tweets

3b. (15 points) Write a Pig Latin query that returns the number of tweets for each user name (not login), ordered from most active to least active users.
You should output one user per line, in the following format:
	user_name, number_of_tweets


4a. (15 points) Write a Pig Latin query that returns the name of users that posted at least two tweets.
You should output one user name per line.

4b. (15 points) Write a Pig Latin query that returns the name of users that posted no tweets.
You should output one user name per line.


-- Requirements --

1. You can write your join in either Java or Python.

Java: In addition to the source code, you will submit a JAR file that can be called using the following command:

hadoop -jar join.jar Join -input1 <file_name> -input2 <file_name> -output <file_name>

Python: In addition to the source code for the mapper (join_map.py) and the reducer (join_reduce.py), you should also submit a script (join.py) that invokes Hadoop and runs your code, and can be called using the following command:

python join.py -input1 <file_name> -input2 <file_name> -output <file_name>

Note: Copy the input files to your HDFS directory. Your program should read the input files from the HDFS directory.

2. You must write the Pig Latin code as stand-alone scripts, one script per query. The
name of the file should correspond to the name of the query. For example, using the
first query, you should be able to run:

pix -x local 1a.pig

to get the result.

3. You must use Apache Hadoop version 1.0.3
4. You must use Apache Pig version 0.11.1 (http://pig.apache.org/docs/r0.11.1/start.html)
5. All outputs for both Hadoop and Pig Latin responses must use default Pig output

When and what to submit

Your assignment is due on November 28, 2013. The required files should be submitted to my.poly.edu.

You must create and submit a ZIP file that contains:

1) If you use Java: Java source code and jar file for the hadoop code: join.java join.jar
   If you use Python: Python source code: join.py, join_map.py, join_reduce.py

2) Pig Latin scripts, one for each query.

3) Output files from both Pig and Hadoop runs.

For each query, the result should be in files whose names have as prefix the query name, and extension '.result'. For instance, for the first query the result should be in 1a.result


--Notes--

No partial grades will be given to assignments that do not run, and no assignments will be accepted after the due date.

Run your Pig queries and MapReduce programs on *your own computer*.

You should already have downloaded Hadoop for your first assignment. If you haven't you can get version 1.0.3 from: https://archive.apache.org/dist/hadoop/core/hadoop-1.0.3/


Here are the instructions on how to install it on a single node:
http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-single-node-cluster/

If you use Java, remember to set the environment variable JAVA_HOME to the appropriate directory in your environment.


Here's a Pig tutorial: https://cwiki.apache.org/confluence/display/PIG/PigTutorial



