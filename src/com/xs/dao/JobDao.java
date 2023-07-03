package com.xs.dao;

import static com.xs.util.common.Constants.JOBTABLE;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.xs.dao.provider.JobDynaSqlProvider;
import com.xs.domain.Job;

public interface JobDao {
	//查询
		@Select("select * from "+JOBTABLE+" ")
		List<Job> get_List();
		@Select("select * from "+JOBTABLE+"  where name like CONCAT('%',#{content},'%')")
		List<Job> get_LikeList(String content);
		
		
		@SelectProvider(type=JobDynaSqlProvider.class,method="insertDept")
		void insert_Info(Job job);
		
		@Select("select * from "+JOBTABLE+" where id = #{id}")
		Job get_Info(Integer id);

		@SelectProvider(type=JobDynaSqlProvider.class,method="updateDept")
		void update_Info(Job job);

		@Delete(" delete from "+JOBTABLE+" where id = #{id} ")
		void delete_Info(Integer id);
}
