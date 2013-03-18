#include "GameMain.h"
#include "Map/FruitMap.h"
#include "TCSceneManager.h"
#include "TCAnimation.h"
#include "TCAnimationCurve.h"
#include "Enemy/Enemy.h"
#include "ParticleSystem/TCParticleSystem.h"
#include "Map/ConnectionEffect.h"
#include "Enemy/EnemyManager.h"
#include "Audio/AudioManager.h"
void GameMain::initGame(){
	_role=Role::alloc(Role_Xigua)->retain<Role>();
	Sprite* bg=Sprite::alloc("bg.png");
	bg->addChild(FruitMap::instance()->node());
	_role=Role::alloc(Role_Xigua)->retain<Role>();
	_role->sprite()->setLocalPosition(Vector2f(-170,270));
	bg->addChild(_role->sprite());
	_role->sprite()->scale(Vector2f(1,1));
	Enemy* snake=EnemyManager::instance()->createEnemy(Enemy_Snake);
	bg->addChild(snake);
	snake->setLocalPosition(Vector2f(170,285));

	ConnectionEffect::instance()->setSpaceNode(bg);
	TCSceneManager::instance()->addChild(bg);

	AudioManager::instance()->load("helloworld.wav");
	AudioManager::instance()->play("helloworld.wav");

}

GameMain::~GameMain(){
	if(_role){
		_role->release();
	}
}