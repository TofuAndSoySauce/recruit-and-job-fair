package kr.happyjob.study.like.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mchange.net.SocketUtils;

import kr.happyjob.study.like.dao.LikeDao;
import kr.happyjob.study.like.model.LikeQueryParam;
import kr.happyjob.study.like.model.LikeRequestDto.Patch;
import kr.happyjob.study.like.model.LikeRequestDto.Post;
import kr.happyjob.study.like.model.LikeResponseDto.LikeList;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	LikeDao likeDao;
	
	@Override
	public List<LikeList> getList(LikeQueryParam queryParam) {
		return likeDao.list(queryParam);
	}

	@Override
	public int save(Post post) {
		Optional<LikeList> optional = Optional.ofNullable(likeDao.getOneByAdNoAndLoginId(post));
		updateIfStatusIsDeleted(optional, post);
		
		return likeDao.save(post);
	}
	
	@Override
	@Transactional
	public int update(Patch patch) {
		int rows = 0;
		String loginId = patch.getLoginId();
		
		for(int p : patch.getAdNoList()){
			Patch param = new Patch(loginId, null, p, null);
			likeDao.updateAsDeleted(param);
			rows++;
		}

		return rows;
	}

	private void verifyAlreadyExists(Optional<LikeList> optional){
		optional.ifPresent(l -> {throw new RuntimeException("이미..있다..");});
	}
	
	private void updateIfStatusIsDeleted(Optional<LikeList> optional, Post post){
		if(optional.isPresent()){
			if(optional.get().isDeleted()){ 
				Patch patch = new Patch(post.getLoginId(), post.getAdNo(), post.getRedirectPageUrl());
				likeDao.updateAsNotDeleted(patch);
				return;
			} else {
				throw new RuntimeException(String.format("이미 즐겨찾기 되어 있습니다."));
			}
		} 
	}

}
