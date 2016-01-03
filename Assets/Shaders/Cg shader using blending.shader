
Shader "Custom/cg shader using blending" {
	SubShader {
		
		Tags { "Queue" = "Transparent" }
	
		Pass {
		
		ZWrite On	// don't write to depth buffer
					// in order not to occlude other objects
		
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		
		struct vertexInput {
			float4 vertex : POSITION;
//			float4 tangent : TANGENT;
//			float3 normal : NORMAL;
//			float4 texcoord : TEXCOORD0;
//			float4 texcoord1 : TEXCOORD1;
//			float4 color : COLOR;
		};
		
		struct vertexOutput {
			float4 pos : SV_POSITION;
			float4 posInObjectCoords : TEXCOORD0;
		};
		
		float4 vert(float4 vertexPos : POSITION) : SV_POSITION
		{
			return mul(UNITY_MATRIX_MVP, vertexPos);
		}

		float4 frag(void) : COLOR
		{
			return float4(0.0, 1.0, 0.0, 0.3);
		}

		ENDCG
		}
	} 
	FallBack "Diffuse"
}
