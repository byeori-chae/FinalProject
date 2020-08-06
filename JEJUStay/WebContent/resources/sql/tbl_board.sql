CREATE TABLE tbl_board
(
    `num`		   INT             NOT NULL    AUTO_INCREMENT COMMENT '게시글 순번', 
    `id`		   VARCHAR(11)     NOT NULL	   COMMENT '아이디',
    `name`		   VARCHAR(11)     NOT NULL    COMMENT '작성자 이름', 
    `subject`      VARCHAR(30)     NOT NULL    COMMENT '제목', 
    `content`      text			   NOT NULL    COMMENT '내용',
    `regist_day`   VARCHAR(15)    NULL        COMMENT '작성날짜', 
    `hit`		   INT			   NULL        COMMENT '조회수', 
	PRIMARY KEY (num)
);