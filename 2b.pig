/**
 * Write a program that computes the natural join between the two collections, using Pig Latin. (local mode)
 *
 * As input it will read from two CSV files that contain descriptions about users and tweets, respectively.
 * Each line in the user collection contains: login, name and state from a specific user.
 * Each line in the collection of tweets has the tweet id, content, and a reference to the user who wrote that tweet.
 */

-- Use the PigStorage function to load the user collection file into the raw bag as an array of records.
-- Input: (login, name, state)
users = LOAD 'users.csv' USING PigStorage(',') AS (login:chararray, name:chararray, state:chararray);

-- Use the PigStorage function to load the tweets collection file into the raw bag as an array of records.
-- Input: (id, content, user)
tweets = LOAD 'tweets.csv' USING PigStorage(',') AS (id:long, content:chararray, user:chararray);

-- Use the JOIN operator to get the natural join between the two collections.
users_join_tweets = JOIN users BY login, tweets BY user;

-- Project-range ( .. ) expressions can be used to project a range of columns from input.
users_natural_join_tweets = foreach users_join_tweets generate .. content;

-- Use the default Pig output function to store the results.
-- Output: (login, name, state, id, content)
STORE users_natural_join_tweets INTO '2b.result' USING PigStorage (',');