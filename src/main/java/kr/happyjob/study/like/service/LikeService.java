package kr.happyjob.study.like.service;

import java.util.List;

import kr.happyjob.study.like.model.LikeQueryParam;
import kr.happyjob.study.like.model.LikeRequestDto.Patch;
import kr.happyjob.study.like.model.LikeRequestDto.Post;
import kr.happyjob.study.like.model.LikeResponseDto.LikeList;

public interface LikeService {
	
	List<LikeList> getList(LikeQueryParam queryParam);
	
	int save(Post post);

	int update(Patch patch);
}
