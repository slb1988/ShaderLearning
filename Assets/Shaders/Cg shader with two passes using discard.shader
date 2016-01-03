
Shader "Custom/osition_in_world_space" {
	SubShader {
		// first pass (is executed before the second pass)
		Pass {
		
		Cull Front
		
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
		
		vertexOutput vert(vertexInput input)
		{
			vertexOutput output;
			
			output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
			output.posInObjectCoords = input.vertex;
			
			return output;
		}

		float4 frag(vertexOutput input) : COLOR
		{
			if (input.posInObjectCoords.y > 0.0)
			{
				discard;
			}
			return float4(1.0, 0.0, 0.0, 1.0);
		}

		ENDCG
		}
		
		Pass {
		
		Cull Back
		
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
		
		vertexOutput vert(vertexInput input)
		{
			vertexOutput output;
			
			output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
			output.posInObjectCoords = input.vertex;
			
			return output;
		}

		float4 frag(vertexOutput input) : COLOR
		{
			if (input.posInObjectCoords.y > 0.0)
			{
				discard;
			}
			return float4(0.0, 1.0, 0.0, 1.0);
		}

		ENDCG
		}
	} 
	FallBack "Diffuse"
}
