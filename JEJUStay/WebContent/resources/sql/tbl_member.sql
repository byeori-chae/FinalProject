CREATE TABLE tbl_member
(
    `mem_idx`    INT		    NOT NULL 	    AUTO_INCREMENT COMMENT '회원번호', 
    `mem_id`     VARCHAR(15)    NOT NULL    	COMMENT '아이디', 
    `mem_pw`     VARCHAR(15)    NOT NULL    	COMMENT '비밀번호', 
    `mem_name`   VARCHAR(11)    NOT NULL    	COMMENT '이름', 
    `mem_phone`  VARCHAR(20)    NOT NULL    	COMMENT '연락처',
    `mem_birth`  VARCHAR(20)    NOT NULL        COMMENT '생일', 
    `mem_email`  VARCHAR(20)    NOT NULL        COMMENT '이메일',
    PRIMARY KEY (mem_idx)
);