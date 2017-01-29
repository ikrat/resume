package net.study.resume.service;

import net.study.resume.entity.Profile;

public interface SocialService<T> {

	Profile loginViaSocialNetwork(T model);
}
