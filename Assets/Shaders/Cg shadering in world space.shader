
Shader "Custom/Cg shadering in world space" {
	SubShader {
		Pass {
		
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag
		#include "UnityCG.cginc"
		
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
			float4 position_in_world_space : TEXCOORD0;
		};
		
		vertexOutput vert(vertexInput input)
		{
			vertexOutput output;
			
			output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
			output.position_in_world_space =
				mul(_Object2World, input.vertex);
			//output.col = input.texcoord;
			//output.col = float4(input.normal.y, 0.0, 0.0, 1.0);
			//output.col = float4(0.0, input.texcoord.y, 0.0, 1.0);
			//output.col = float4(
			//	(input.normal + float3(1.0, 1.0, 1.0)) / 2.0, 1.0);
			//input.texcoord;
			//input.vertex;
			//input.tangent;
			//input.texcoord1;
			//input.color;
			
			// black
			//output.col = input.texcoord - float4(1.5, 2.3, 1.1, 0.0);
			//output.col = input.texcoord.zzzz;
			//output.col = input.texcoord / tan(0.0);
			
			//output.col = dot(input.normal, input.tangent.xyz) * input.texcoord;
			//output.col = radians(input.texcoord);
			
			return output;
		}

		float4 frag(vertexOutput input) : COLOR
		{
			float dist = distance(input.position_in_world_space, float4(0.0, 0.0, 0.0, 1.0));
			
			if (dist < 5.0)
			{
				return float4(0.0, 1.0, 0.0, 1.0);
			}
			else
			{
				return float4(0.1, 0.1, 0.1, 1.0);
			}
			
		}

		ENDCG
		}
	} 
	FallBack "Diffuse"
}
