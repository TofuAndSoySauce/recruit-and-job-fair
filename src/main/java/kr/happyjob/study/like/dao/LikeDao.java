package kr.happyjob.study.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.happyjob.study.like.model.LikeQueryParam;
import kr.happyjob.study.like.model.LikeRequestDto.Patch;
import kr.happyjob.study.like.model.LikeRequestDto.Post;
import kr.happyjob.study.like.model.LikeResponseDto.LikeList;

public interface LikeDao {

	List<LikeList> list(@Param("param") LikeQueryParam param);
	
	int save(Post post);
	
	LikeList getOneByAdNoAndLoginId(Post post);
	
	int updateAsDeleted(Patch patch);
	
	int updateAsNotDeleted(Patch patch);
}
