CREATE TABLE tbl_board
(
    `num`		   INT             NOT NULL    AUTO_INCREMENT COMMENT '�Խñ� ����', 
    `id`		   VARCHAR(11)     NOT NULL	   COMMENT '���̵�',
    `name`		   VARCHAR(11)     NOT NULL    COMMENT '�ۼ��� �̸�', 
    `subject`      VARCHAR(30)     NOT NULL    COMMENT '����', 
    `content`      text			   NOT NULL    COMMENT '����',
    `regist_day`   VARCHAR(15)    NULL        COMMENT '�ۼ���¥', 
    `hit`		   INT			   NULL        COMMENT '��ȸ��', 
	PRIMARY KEY (num)
);