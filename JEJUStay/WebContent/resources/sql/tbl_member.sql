CREATE TABLE tbl_member
(
    `mem_idx`    INT		    NOT NULL 	    AUTO_INCREMENT COMMENT 'ȸ����ȣ', 
    `mem_id`     VARCHAR(15)    NOT NULL    	COMMENT '���̵�', 
    `mem_pw`     VARCHAR(15)    NOT NULL    	COMMENT '��й�ȣ', 
    `mem_name`   VARCHAR(11)    NOT NULL    	COMMENT '�̸�', 
    `mem_phone`  VARCHAR(20)    NOT NULL    	COMMENT '����ó',
    `mem_birth`  VARCHAR(20)    NOT NULL        COMMENT '����', 
    `mem_email`  VARCHAR(20)    NOT NULL        COMMENT '�̸���',
    PRIMARY KEY (mem_idx)
);