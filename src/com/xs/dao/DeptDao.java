package com.xs.dao;

import static com.xs.util.common.Constants.DEPTTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import com.xs.dao.provider.DeptDynaSqlProvider;
import com.xs.domain.Dept;
public interface DeptDao {
	//查询
	@Select("select * from "+DEPTTABLE+" ")
	List<Dept> selectAllDept();
	@Select("select * from "+DEPTTABLE+" where name like CONCAT('%',#{content},'%')")
	List<Dept> selectLikeAllDept(String content);
	
	
	@SelectProvider(type=DeptDynaSqlProvider.class,method="insertDept")
	void save(Dept dept);
	
	@Select("select * from "+DEPTTABLE+" where id = #{id}")
	Dept get_Info(Integer id);

	@SelectProvider(type=DeptDynaSqlProvider.class,method="updateDept")
	void update_Info(Dept dept);

	@Delete(" delete from "+DEPTTABLE+" where id = #{id} ")
	void delete_Info(Integer id);

	
}
