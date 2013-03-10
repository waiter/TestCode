#ifndef __TC_BASENODE_H__
#define __TC_BASENODE_H__
#include <map>
#include <vector>
#include "AutoReleaseObject.h"
#include "BaseComponent.h"
#include "TCVector2f.h"
#include "TCMatrix3x3.h"



using namespace std;
NS_TC_BEGIN

enum ComponentType{
	ComponentDrawer=0,
	ComponentTouch=1,
	ComponentAnimation=2,
};

typedef bool (AutoReleaseObject::*delegateUpdate)();
#define updateSelector(_SELECTOR) (delegateUpdate)(&_SELECTOR)

class BaseComponent;
class AutoReleaseObject;
class AnimationContainer;

class BaseNode:public AutoReleaseObjectTemplete<BaseNode>{
	friend class AutoReleaseObjectTemplete<BaseNode>;
	typedef vector<BaseNode*> ArrayList;
	typedef ArrayList::iterator iterator;
	//====class=====///
private:
	ArrayList _childrenList;
	map<ComponentType,BaseComponent*> _componentMap;
	BaseNode* _parent;
	Vector2f _position;
	float _rotation;
	AutoReleaseObject* _updateTarget;//weak ref
	delegateUpdate _delegateUpdate;
protected:
	~BaseNode();
	BaseNode();
public:
	void addChild(BaseNode* child);
	BaseNode* getChild(int index);
	void removeAllChildren();

	void addComponent(BaseComponent* component);

	BaseComponent* getComponment(ComponentType type);

	AnimationContainer* animation();

	void removeAllComponement();

	inline int size(){
		return _childrenList.size();
	}

	bool removeChild(BaseNode* child);

	inline const ArrayList& childList() const{
		return _childrenList;
	}
//transform

	inline Vector2f localPosition(){
		return _position;
	}
	inline void setLocalPosition(const Vector2f& pos){
		_position=pos;
	}
	inline Vector2f worldPosition(){
		if(_parent){
			return _position+_parent->worldPosition();
		}
		return _position;
	}
	inline void setWorldPosition(const Vector2f& pos){
		_position+=(pos-worldPosition());
	}

	TCMatrix3x3 localToParentMatrix() const;

	TCMatrix3x3 parentToLocalMatrix() const;

	inline void rotate(float degree){
		_rotation+=degree;
	}
	inline void registerUpdate(AutoReleaseObject* target,delegateUpdate updateAction){
		_updateTarget=target;//weak ref
		_delegateUpdate=updateAction;
	}

	void virtual invokeUpdate();

	void removeSelf();
};

NS_TC_END
#endif