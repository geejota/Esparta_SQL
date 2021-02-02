# Esparta_SQL
SQL and database performance


Exercise proposed by Esparta Co for database structure and SQL commands.

I am not used with some filter commands, but I guess I am able to understand some structures just by get into the model business.
In this particular exercise, I've divided my code in 4 steps. First of all, to Create Database and Tables, then, I've insert primary data, as student and professors' names, then data that I call relational data, and last of all the exercise proposal.


**The first challenge** was to find names of all students that has classes from a certain professor, with no mistery I've just joined two tables matching ids of student and student_id in Class table with a filter.

**The second one**, I supposes was easier, I've just selected data from a column in a table with a filter in the column where I want as a condition

**The third one** I could write logical operator as OR, that I could not only use a Join to find the matching values, but filter with WHERE command to declare the condition and a complex condition with two statements.

**The fourth one**, it was the same example as the second one, but the data that I used as a condition is a null value.

**Finally, the last one**, was really hard to understand how could I write a selection, inside another selection. That's the first time I did this yet. But in long short version, I use a first selecion to find all students that has a condition, then a outer join, it was extracted from the second condition selection, and finally a matching values to find the name of students who has that condition statement declared before.

For this test, I wrote on VSCode, but run on MySQL Workbench.
