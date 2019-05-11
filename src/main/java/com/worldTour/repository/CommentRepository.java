package com.worldTour.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.worldTour.model.Comment;


@Repository("commentRepository")
public interface CommentRepository extends CrudRepository<Comment, Long> {

}