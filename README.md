# enova_data_smackdown_2016
An attempt at Enova's data analysis challenge...


**Scenario**

You are an analytics employee working for a book publisher. Your company has data on books
they published in the past 5 years, including details about the book, the author, how much they
paid the author for the book, and how much they paid for advertising. They also have data on
how much revenue the book generated in its first year.
Your company has to decide which books they would like to publish this year and how much
they want to spend on advertising for each book. They have a set budget, which they can spend
on buying books from authors and advertising them. Prices for books are set, but they can
decide the advertising budget. 


Goal

Your boss comes to you with a new list of prospective books (training.csv). She asks you to
figure out whether to publish a book and how much to spend on advertising each book.
Remember that there is a total budget of $300 million available for both author advances (the
amount of money you pay the author) and advertising. In order to reduce risk, your company is
only allowing up to $100,000 to be spent on advertising for an individual book.


Data Set

We are provided a training data set which contains all the information
about the books for the past 5 years. We also have a validation data set (validation.csv) that you are to use to determine which
books to publish and how much to spend on advertising on each book.

The variables are defined in the file DataDictionary.xlsx. They are categorized as follows:

1. Book Classification – Variables that categorize the book

2. Metadata – Variables that capture metadata like number of authors, number of chapters

3. Internal Score – The set of scores on various dimensions provided by internal editors

4. Author Metric – Variables that capture details of the author

5. Reading Score – Reading score for the book

6. Performance – Information on how the books performed.

7. Advertising – Contains the ad_budget variable, amount spent on advertising.

8. Author Advance – Advance to be paid to the author


Output

A comma separated text file (CSV) that contains three columns:

a. book_id – the ID of the book

b. import_decision - coded as 0 or 1. A value of 0 indicates that you DO NOT

recommend publishing the book, 1 indicates that you DO recommend publishing the book.

c. ad_budget - the amount in dollars to spend on advertising
