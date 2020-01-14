// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33695,y:32856,varname:node_3138,prsc:2|emission-4054-OUT,alpha-9063-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32257,y:32627,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_ViewPosition,id:8722,x:31438,y:32870,varname:node_8722,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7441,x:32576,y:32688,varname:node_7441,prsc:2|A-7241-RGB,B-7168-OUT;n:type:ShaderForge.SFN_DepthBlend,id:2931,x:32522,y:32371,varname:node_2931,prsc:2;n:type:ShaderForge.SFN_ObjectPosition,id:5598,x:31438,y:33031,varname:node_5598,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9156,x:32770,y:32624,varname:node_9156,prsc:2|A-7961-OUT,B-7441-OUT;n:type:ShaderForge.SFN_Slider,id:7961,x:32194,y:32490,ptovrint:False,ptlb:Gain,ptin:_Gain,varname:node_7961,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:15,max:500;n:type:ShaderForge.SFN_Multiply,id:8027,x:33070,y:32643,varname:node_8027,prsc:2|A-263-OUT,B-9156-OUT;n:type:ShaderForge.SFN_Time,id:5186,x:31426,y:32589,varname:node_5186,prsc:2;n:type:ShaderForge.SFN_Fresnel,id:3867,x:32737,y:32958,varname:node_3867,prsc:2|EXP-9710-OUT;n:type:ShaderForge.SFN_Cos,id:4184,x:32017,y:32670,varname:node_4184,prsc:2|IN-9550-OUT;n:type:ShaderForge.SFN_Slider,id:5476,x:31328,y:32767,ptovrint:False,ptlb:Blink Speed,ptin:_BlinkSpeed,varname:node_5476,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Multiply,id:9550,x:31772,y:32636,varname:node_9550,prsc:2|A-5186-TDB,B-5476-OUT;n:type:ShaderForge.SFN_Multiply,id:4054,x:33305,y:32786,varname:node_4054,prsc:2|A-8027-OUT,B-5611-OUT;n:type:ShaderForge.SFN_Slider,id:9710,x:32363,y:33032,ptovrint:False,ptlb:Fresnel Exponent,ptin:_FresnelExponent,varname:node_9710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;n:type:ShaderForge.SFN_OneMinus,id:5611,x:32912,y:32910,varname:node_5611,prsc:2|IN-3867-OUT;n:type:ShaderForge.SFN_If,id:263,x:32786,y:32373,varname:node_263,prsc:2|A-7292-OUT,B-2931-OUT,GT-7292-OUT,EQ-7292-OUT,LT-2931-OUT;n:type:ShaderForge.SFN_Vector1,id:7292,x:32522,y:32292,varname:node_7292,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:633,x:33208,y:33112,varname:node_633,prsc:2|A-5611-OUT,B-7168-OUT;n:type:ShaderForge.SFN_Multiply,id:7168,x:32278,y:32824,varname:node_7168,prsc:2|A-4184-OUT,B-5899-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:9063,x:33467,y:33111,varname:node_9063,prsc:2,min:0,max:5000|IN-633-OUT;n:type:ShaderForge.SFN_Distance,id:6278,x:31685,y:32942,varname:node_6278,prsc:2|A-8722-XYZ,B-5598-XYZ;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:5899,x:32069,y:32942,varname:node_5899,prsc:2|IN-4403-OUT,IMIN-4990-OUT,IMAX-4372-OUT,OMIN-4372-OUT,OMAX-4990-OUT;n:type:ShaderForge.SFN_Clamp,id:4403,x:31850,y:33106,varname:node_4403,prsc:2|IN-6278-OUT,MIN-4990-OUT,MAX-4372-OUT;n:type:ShaderForge.SFN_Slider,id:4372,x:31374,y:33345,ptovrint:False,ptlb:Max View Distance,ptin:_MaxViewDistance,varname:node_4372,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:9999;n:type:ShaderForge.SFN_Vector1,id:4990,x:31470,y:33237,varname:node_4990,prsc:2,v1:0;proporder:7241-7961-5476-9710-4372;pass:END;sub:END;*/

Shader "Shader Forge/LaserShader" {
    Properties {
        _Color ("Color", Color) = (1,0,0,1)
        _Gain ("Gain", Range(0, 500)) = 15
        _BlinkSpeed ("Blink Speed", Range(0, 2)) = 1
        _FresnelExponent ("Fresnel Exponent", Range(0, 2)) = 2
        _MaxViewDistance ("Max View Distance", Range(0, 9999)) = 5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _Color;
            uniform float _Gain;
            uniform float _BlinkSpeed;
            uniform float _FresnelExponent;
            uniform float _MaxViewDistance;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
////// Emissive:
                float node_7292 = 1.0;
                float node_2931 = saturate((sceneZ-partZ));
                float node_263_if_leA = step(node_7292,node_2931);
                float node_263_if_leB = step(node_2931,node_7292);
                float4 node_5186 = _Time;
                float node_4990 = 0.0;
                float node_7168 = (cos((node_5186.b*_BlinkSpeed))*(_MaxViewDistance + ( (clamp(distance(_WorldSpaceCameraPos,objPos.rgb),node_4990,_MaxViewDistance) - node_4990) * (node_4990 - _MaxViewDistance) ) / (_MaxViewDistance - node_4990)));
                float node_5611 = (1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelExponent));
                float3 emissive = ((lerp((node_263_if_leA*node_2931)+(node_263_if_leB*node_7292),node_7292,node_263_if_leA*node_263_if_leB)*(_Gain*(_Color.rgb*node_7168)))*node_5611);
                float3 finalColor = emissive;
                return fixed4(finalColor,clamp((node_5611*node_7168),0,5000));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
