CREATE TABLE tbl_consult
(
    `cst_no`       INT 		    	NOT NULL    AUTO_INCREMENT COMMENT '����', 
    `cst_name`     VARCHAR(11)     	NULL    	COMMENT '�ۼ��� �̸�', 
    `cst_content`  text			    NULL    	COMMENT '�ۼ�����',
    `cst_date`	   timestamp    	NOT NULL   	COMMENT '�ۼ���',
    `cst_idx`      INT       		NULL    	COMMENT '�����ȣ',
    PRIMARY KEY(cst_no)
);