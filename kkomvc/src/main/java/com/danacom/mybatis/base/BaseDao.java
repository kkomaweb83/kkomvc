package com.danacom.mybatis.base;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BaseDao {
	@Autowired
	protected SqlSessionTemplate template;
	
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	public SqlSessionTemplate getTemplate() {
		return template;
	}
	
	public int get_found_rows() {
		return template.selectOne("found_rows");
	}

	public void commit() {
		template.commit();
	}
	
}
