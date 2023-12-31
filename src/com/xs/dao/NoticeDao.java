package com.xs.dao;

import static com.xs.util.common.Constants.NOTICETABLE;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.xs.dao.provider.NoticeDynaSqlProvider;
import com.xs.domain.Notice;

public interface NoticeDao {

	@Select("select * from "+NOTICETABLE+" ")
	List<Notice> get_List();
	@Select("select * from "+NOTICETABLE+"  where title like CONCAT('%',#{content},'%')")
	List<Notice> get_LikeList(String content);

	@SelectProvider(type=NoticeDynaSqlProvider.class,method="insert_Notice")
	void insert_Info(Notice employee);
	
	@Select("select * from "+NOTICETABLE+" where id = #{id}")
	Notice get_Info(Integer id);

	@SelectProvider(type=NoticeDynaSqlProvider.class,method="update_Notice")
	void update_Info(Notice employee);

	@Delete(" delete from "+NOTICETABLE+" where id = #{id} ")
	void delete_Info(Integer id);

}
