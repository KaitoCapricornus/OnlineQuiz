SELECT TOP 10 q.*, qa.answer FROM Quiz q inner join Quiz_Ans qa on q.quiz_id = qa.quiz_id
ORDER BY NEWID()  

select * from Quiz q inner join Quiz_Ans qa on q.quiz_id = qa.quiz_id

select * from Account

declare @i int = 2;
while(@i < 1000)
begin
	insert into Quiz(question, creater, option_1, option_2, option_3, option_4)
	values ('Question_' + cast(@i as nvarchar), 'kaito', 'Option_A', 'Option_B', 'Option_C', 'Option_D');
	insert into Quiz_Ans
	values(@i, @i % 4 + 1);
	set @i = @i + 1;
end
