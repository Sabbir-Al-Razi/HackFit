<div class="box box-info" style="min-height: 410px;">
    <div class="box-header with-border">
        <h3 class="box-title">Result</h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>

    <!-- /.box-header -->
    <div class="box-body">

        <div class="col-md-12">
            <div class="row">
                <div class="row">
                    <div class="col-xs-12 text-center">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="300px" height="163px" viewBox="0 0 300 163" >
                            <g transform="translate(18,18)" style="font-family:arial,helvetica,sans-serif;font-size: 12px;">
                                <defs>
                                    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto">
                                        <polygon points="0 0, 10 3.5, 0 7" />
                                    </marker>

                                    <path id="curvetxt1" d="M-4 140 A140 140, 0, 0, 1, 284 140" style="fill: none;"/>
                                    <path id="curvetxt2" d="M33 43.6 A140 140, 0, 0, 1, 280 140" style="fill: #none;"/>
                                    <path id="curvetxt3" d="M95 3 A140 140, 0, 0, 1, 284 140" style="fill: #none;"/>
                                    <path id="curvetxt4" d="M235.4 33 A140 140, 0, 0, 1, 284 140" style="fill: #none;"/>
                                </defs>

                                <path d="M0 140 A140 140, 0, 0, 1, 6.9 96.7 L140 140 Z" fill="#bc2020" />
                                <path d="M6.9 96.7 A140 140, 0, 0, 1, 12.1 83.1 L140 140 Z" fill="#d38888" />
                                <path d="M12.1 83.1 A140 140, 0, 0, 1, 22.6 63.8 L140 140 Z" fill="#ffe400" />
                                <path d="M22.6 63.8 A140 140, 0, 0, 1, 96.7 6.9 L140 140 Z" fill="#008137" />
                                <path d="M96.7 6.9 A140 140, 0, 0, 1, 169.1 3.1 L140 140 Z" fill="#ffe400" />
                                <path d="M169.1 3.1 A140 140, 0, 0, 1, 233.7 36 L140 140 Z" fill="#d38888" />
                                <path d="M233.7 36 A140 140, 0, 0, 1, 273.1 96.7 L140 140 Z" fill="#bc2020" />
                                <path d="M273.1 96.7 A140 140, 0, 0, 1, 280 140 L140 140 Z" fill="#8a0101" />
                                <path d="M45 140 A90 90, 0, 0, 1, 230 140 Z" fill="#fff" />

                                <circle cx="140" cy="140" r="5" fill="#666" />
                                <g style="paint-order: stroke;stroke: #fff;stroke-width: 2px;">
                                    <text x="25" y="111"  transform="rotate(-72, 25, 111)">16</text>
                                    <text x="30" y="96"  transform="rotate(-66, 30, 96)">17</text>
                                    <text x="35" y="83"  transform="rotate(-57, 35, 83)">18.5</text>
                                    <text x="97" y="29"  transform="rotate(-18, 97, 29)">25</text>
                                    <text x="157" y="20"  transform="rotate(12, 157, 20)">30</text>
                                    <text x="214" y="45"  transform="rotate(42, 214, 45)">35</text>
                                    <text x="252" y="95"  transform="rotate(72, 252, 95)">40</text>
                                </g>
                                <g style="font-size: 14px;">
                                    <text><textPath xlink:href="#curvetxt1">Underweight</textPath></text>
                                    <text><textPath xlink:href="#curvetxt2">Normal</textPath></text>
                                    <text><textPath xlink:href="#curvetxt3">Overweight</textPath></text>
                                    <text><textPath xlink:href="#curvetxt4">Obesity</textPath></text>
                                </g>

                                <line x1="140" y1="140" x2="65" y2="140" stroke="#666" stroke-width="2" marker-end="url(#arrowhead)">
                                    <animateTransform attributeName="transform" attributeType="XML" type="rotate" from="0 140 140" to="{{$bmi>0?$bmi_meter:0}} 140 140" dur="1s" fill="freeze" repeatCount="1"/>
                                </line>

                                <text x="67" y="120" style="font-size: 27px;font-weight:bold;color:#000;">BMI = {{$bmi>0?$bmi:'0.00'}}</text>
                            </g>
                        </svg>
                    </div>

                    <div class="col-xs-12">
                        <div class="col-sm-offset-1 col-sm-10">
                            <h4 style="font-weight: bold;margin-bottom: 5px;margin-top: 2px;">BMI = {{$bmi>0?$bmi:'0.00'}} kg/m<sup>2</sup> @if($bmi>0)(<span style="color: {{$class=='Normal'?'green':'red'}}">{{$class}}</span>)@endif</h4>
                            <ul style="margin-left:8px;padding-left:8px;font-size: 16px;margin-bottom: 8px;">
                                <li>Healthy BMI range: @if($bmi>0)18.5 kg/m<sup>2</sup> - 25 kg/m<sup>2</sup> @endif</li>
                                <li>Healthy weight for the height: @if($bmi>0){{$healthy_weight_min}} kg - {{$healthy_weight_max}} kg @endif</li>
                                <li>BMI Prime: @if($bmi>0){{$bmi_prime}} @endif</li>
                                <li>Ponderal Index: @if($bmi>0){{$ponderal_index}} kg/m<sup>3</sup> @endif</li>
                            </ul>
                            @if($bmi>0)<h3 style="{{($lose_weight>0 || $gain_weight>0)?'color:red;':'color:green;'}} font-weight: bold;font-size: 20px;margin: 0;border: 1px solid #ccc;padding: 8px;width: 100%;text-align: center;">@if($lose_weight>0)Lose {{$lose_weight}} kg to reach a BMI of 25 kg/m<sup>2</sup>@elseif($gain_weight>0)Gain {{$gain_weight}} kg to reach a BMI of 18.5 kg/m<sup>2</sup>@else{{'Congratulations, Your BMI is normal'}}@endif</h3>@endif
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.box-body -->
</div>
