from ursina import *
from ursina.prefabs.first_person_controller import FirstPersonController

class voxel(Button){
	def __init__(self, pos){
		super().__init__(
		position = pos,
		parent = scene,
		scale = 1,
		model = "cube",
		origin_y = 0.5,
		texture = "white_cube",
		color = color.white,
		highlight_color = color.gray
		)
	}
	def input(self, key){
		if self.hovered{
			if key == "left mouse down"{
				destroy(self)
			}elif key == "right mouse down"{
				vox = voxel(self.position + mouse.normal)
			}
		}
	}
}

def main(){
	app = Ursina()

	for x in range(20){
		for y in range(20){
			for z in range(20){
				if x in (0, 19){
					vox = voxel((x, y, z))
				}
				if y in (0, 19){
					vox = voxel((x, y, z))
				}
				if z in (0, 19){
					vox = voxel((x, y, z))
				}
			}
		}
	}

	player = FirstPersonController()

	app.run()
}