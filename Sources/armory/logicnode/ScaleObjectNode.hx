package armory.logicnode;

import armory.object.Object;
import armory.math.Mat4;
import armory.math.Vec4;
#if arm_physics
import armory.trait.physics.RigidBody;
#end

class ScaleObjectNode extends LogicNode {

	public function new(tree:LogicTree) {
		super(tree);
	}

	override function run() {
		var object:Object = inputs[1].get();
		var vec:Vec4 = inputs[2].get();

		if (object == null) return;

		object.transform.scale.add(vec);
		object.transform.buildMatrix();

		#if arm_physics
		var rigidBody = object.getTrait(RigidBody);
		if (rigidBody != null) rigidBody.syncTransform();
		#end

		super.run();
	}
}
