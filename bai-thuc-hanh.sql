create database md3_bai4_baithuchanh;
-- drop database md3_bai4_baithuchanh;
use md3_bai4_baithuchanh;

SELECT * FROM md3_bai3_baithuchanh1.class;
SELECT * FROM md3_bai3_baithuchanh1.student;
SELECT * FROM md3_bai3_baithuchanh1.subject;
SELECT * FROM md3_bai3_baithuchanh1.mark;

-- Hiển thị số lượng sinh viên ở từng nơi
SELECT st.Address, COUNT(st.StudentId) AS 'Số lượng học viên' 
FROM md3_bai3_baithuchanh1.student st
GROUP BY st.Address; 

-- Tính điểm trung bình các môn học của mỗi học viên
SELECT S.StudentId,S.StudentName, AVG(M.Mark)
FROM md3_bai3_baithuchanh1.student S join md3_bai3_baithuchanh1.mark M on S.StudentId = M.StudentId 
GROUP BY S.StudentId, S.StudentName;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.StudentId,S.StudentName, AVG(M.Mark)
FROM md3_bai3_baithuchanh1.student S join md3_bai3_baithuchanh1.mark M on S.StudentId = M.StudentId 
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 15; 

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất. 
SELECT S.StudentId, S.StudentName, AVG(M.Mark)
FROM md3_bai3_baithuchanh1.student S join md3_bai3_baithuchanh1.mark M on S.StudentId = M.StudentId 
GROUP BY S.StudentId, S.StudentName
HAVING AVG(M.Mark) >= ALL (SELECT AVG(M.Mark) FROM md3_bai3_baithuchanh1.mark M GROUP BY M.StudentId);