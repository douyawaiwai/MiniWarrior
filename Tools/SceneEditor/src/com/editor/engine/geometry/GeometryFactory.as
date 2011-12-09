package com.editor.engine.geometry
{
	import away3d.materials.SkyBoxMaterial;
	
	
	
	public class GeometryFactory
	{
		public var coordinateSystem : String ;
		
		protected var propertyFactory : GeometryPropertyFactory ;
		protected var _precision : uint ;
		
		
		
		public function GeometryFactory ( )
		{
			this.propertyFactory = new GeometryPropertyFactory ( ) ;
		}
		
		
		
		//
		// Public Methods
		//
		////////////////////////////////////////////////////////////////////////////////
		
		
		
		public function build ( attribute : DynamicAttributeVO , vo : SceneGeometryVO ) : SceneGeometryVO
		{
			var s : uint = this.precision ;
			
			switch ( attribute.value )
			{
				case GeometryType.OBJ :
				{
						
					break ;
				}
				default :
				{
					vo = this.buildDefault ( vo ) ;
				}
			}
			
			vo.geometryType = attribute.value ;
			
			return vo ;
		}
		
		
		
		public function buildDefault ( vo : SceneGeometryVO ) : SceneGeometryVO
		{
			var s : uint = this.precision ;
			var plane : Plane = new Plane ( ) ;
			
			plane.width = s ;
			plane.height = s ;
			plane.material = vo.material as ColorMaterial ;
			
			vo.mesh = plane ;
			
			return vo ;
		}
		
		
		
		////////////////////////////////////////////////////////////////////////////////
		//
		// Getters and Setters
		//
		////////////////////////////////////////////////////////////////////////////////
		
		
		
		public function set precision ( value : uint ) : void
		{
			this._precision = value ;
			this.propertyFactory.precision = value ;
		}
		
		
		
		public function get precision ( ) : uint
		{
			return this._precision ;
		}
	}