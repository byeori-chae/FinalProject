CREATE TABLE tbl_consult
(
    `cst_no`       INT 		    	NOT NULL    AUTO_INCREMENT COMMENT '순번', 
    `cst_name`     VARCHAR(11)     	NULL    	COMMENT '작성자 이름', 
    `cst_content`  text			    NULL    	COMMENT '작성내용',
    `cst_date`	   timestamp    	NOT NULL   	COMMENT '작성일',
    `cst_idx`      INT       		NULL    	COMMENT '예약번호',
    PRIMARY KEY(cst_no)
);