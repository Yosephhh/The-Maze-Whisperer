// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-3084-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31864,y:32754,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7843137,c2:0.07843139,c3:0.07843139,c4:1;n:type:ShaderForge.SFN_Time,id:4289,x:31051,y:32894,varname:node_4289,prsc:2;n:type:ShaderForge.SFN_Tan,id:1201,x:31230,y:32967,varname:node_1201,prsc:2|IN-4289-TDB;n:type:ShaderForge.SFN_Fresnel,id:5218,x:31496,y:33164,varname:node_5218,prsc:2|NRM-3873-OUT,EXP-4146-OUT;n:type:ShaderForge.SFN_Slider,id:4146,x:31145,y:33396,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_4146,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_NormalVector,id:3873,x:31223,y:33147,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:5303,x:31888,y:33014,varname:node_5303,prsc:2|A-6921-OUT,B-3435-OUT;n:type:ShaderForge.SFN_Multiply,id:8915,x:32106,y:32899,varname:node_8915,prsc:2|A-7241-RGB,B-5303-OUT;n:type:ShaderForge.SFN_Slider,id:2658,x:32029,y:32600,ptovrint:False,ptlb:Gain,ptin:_Gain,varname:node_2658,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:500;n:type:ShaderForge.SFN_OneMinus,id:3435,x:31691,y:33092,varname:node_3435,prsc:2|IN-5218-OUT;n:type:ShaderForge.SFN_Multiply,id:4896,x:32387,y:32802,varname:node_4896,prsc:2|A-2658-OUT,B-8915-OUT;n:type:ShaderForge.SFN_Cos,id:561,x:31230,y:32774,varname:node_561,prsc:2|IN-4289-TDB;n:type:ShaderForge.SFN_SwitchProperty,id:2764,x:31455,y:32861,ptovrint:False,ptlb:Blink Type,ptin:_BlinkType,varname:node_2764,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-561-OUT,B-1201-OUT;n:type:ShaderForge.SFN_Multiply,id:6921,x:31668,y:32849,varname:node_6921,prsc:2|A-6498-OUT,B-2764-OUT;n:type:ShaderForge.SFN_Slider,id:6498,x:31230,y:32649,ptovrint:False,ptlb:Blink Speed,ptin:_BlinkSpeed,varname:node_6498,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:100;n:type:ShaderForge.SFN_Slider,id:5860,x:31691,y:33323,ptovrint:False,ptlb:Min Brightness,ptin:_MinBrightness,varname:node_5860,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:3;n:type:ShaderForge.SFN_Multiply,id:3913,x:32387,y:33009,varname:node_3913,prsc:2|A-7241-RGB,B-1720-OUT;n:type:ShaderForge.SFN_Max,id:3084,x:32557,y:32902,varname:node_3084,prsc:2|A-4896-OUT,B-3913-OUT;n:type:ShaderForge.SFN_Multiply,id:1720,x:32041,y:33180,varname:node_1720,prsc:2|A-3435-OUT,B-5860-OUT;proporder:7241-4146-2658-2764-6498-5860;pass:END;sub:END;*/

Shader "Shader Forge/BlinkingLED" {
    Properties {
        _Color ("Color", Color) = (0.7843137,0.07843139,0.07843139,1)
        _Fresnel ("Fresnel", Range(0, 2)) = 1
        _Gain ("Gain", Range(0, 500)) = 1
        [MaterialToggle] _BlinkType ("Blink Type", Float ) = 0
        _BlinkSpeed ("Blink Speed", Range(0, 100)) = 1
        _MinBrightness ("Min Brightness", Range(0, 3)) = 0.5
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _Fresnel;
            uniform float _Gain;
            uniform fixed _BlinkType;
            uniform float _BlinkSpeed;
            uniform float _MinBrightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 node_4289 = _Time;
                float node_3435 = (1.0 - pow(1.0-max(0,dot(i.normalDir, viewDirection)),_Fresnel));
                float3 emissive = max((_Gain*(_Color.rgb*((_BlinkSpeed*lerp( cos(node_4289.b), tan(node_4289.b), _BlinkType ))*node_3435))),(_Color.rgb*(node_3435*_MinBrightness)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
