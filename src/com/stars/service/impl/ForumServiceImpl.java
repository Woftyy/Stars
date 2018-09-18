package com.stars.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stars.service.ForumService;

@Service
@Transactional(readOnly=true)
public class ForumServiceImpl implements ForumService{

}
