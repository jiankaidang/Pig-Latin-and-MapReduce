/**
 * Write a Pig Latin query that returns the name of users that posted no tweets. (local mode)
 *
 * As input it will read from two CSV files that contain descriptions about users and tweets, respectively.
 * Each line in the user collection contains: login, name and state from a specific user.
 * Each line in the collection of tweets has the tweet id, content, and a reference to the user who wrote that tweet.
 *
 * Output one user name per line.
 */

-- Use the PigStorage function to load the user collection file into the raw bag as an array of records.
-- Input: (login, name, state)
users = LOAD 'users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);

-- Use the PigStorage function to load the tweets collection file into the raw bag as an array of records.
-- Input: (id, content, user)
tweets = LOAD 'tweets.csv' USING PigStorage(',') AS (id:long, content:chararray, user:chararray);

-- Performs an outer join of two relations based on common field values.
users_join_tweets = JOIN users BY login LEFT, tweets BY user;

login_group = GROUP users_join_tweets BY (login, name);
number_of_tweets = FOREACH login_group GENERATE group, COUNT(users_join_tweets.id) as number;
no_tweets = FILTER number_of_tweets BY number == 0;
no_tweets_names = FOREACH no_tweets GENERATE group.name;

-- Use the default Pig output function to store the results.
STORE no_tweets_names INTO '4b.result';