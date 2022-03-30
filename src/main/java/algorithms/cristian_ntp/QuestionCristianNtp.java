package algorithms.cristian_ntp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import util.DateUtil;

public class QuestionCristianNtp {

    private final long questionId;
    private final byte[] ntpMesage; // Bản tin Ntp
    private final Date originateSendTimestamp; // T1
    private final Date receiveTimestamp; // T2
    private final Date transmitTimestamp; // T3
    private final Date originateReceiveTime; // T4
    private final long differentTicks; // Theta
    private final Date dateTimeAfterSynchronize; // FinalDateTime

    private final long originateTimeUtcTick; // T4 Tick (C#)

    private QuestionCristianNtp(long questionId, short[] ntpMesage, Date originateSendTimestamp, Date receiveTimestamp, Date transmitTimestamp, Date originateReceiveTime, long differentTicks, Date dateTimeAfterSynchronize, long originateTimeUtcTick) {
        this.questionId = questionId;
        this.ntpMesage = new byte[ntpMesage.length];
        for (int i = 0; i < ntpMesage.length; i++) {
            Short s = ntpMesage[i];
            this.ntpMesage[i] = s.byteValue();
        }
        this.originateSendTimestamp = originateSendTimestamp;
        this.receiveTimestamp = receiveTimestamp;
        this.transmitTimestamp = transmitTimestamp;
        this.originateReceiveTime = originateReceiveTime;
        this.differentTicks = differentTicks;
        this.dateTimeAfterSynchronize = dateTimeAfterSynchronize;
        this.originateTimeUtcTick = originateTimeUtcTick;
    }

    private static final List<QuestionCristianNtp> questionCristianNtps = new ArrayList<>(Arrays.asList(
            new QuestionCristianNtp(
                    1,
                    new short[]{28, 03, 00, 233, 00, 00, 00, 114,
                        00, 00, 12, 160, 25, 66, 230, 04,
                        225, 72, 40, 195, 105, 242, 38, 249,
                        00, 00, 00, 00, 00, 00, 00, 00,
                        225, 72, 40, 208, 41, 242, 12, 33,
                        225, 72, 40, 208, 41, 242, 52, 101},
                    DateUtil.parse("2019-10-09 16:37:07.413"),
                    DateUtil.parse("2019-10-09 16:37:20.163"),
                    DateUtil.parse("2019-10-09 16:37:20.163"),
                    DateUtil.parse("2019-10-09 16:37:29.229"),
                    18420000,
                    DateUtil.parse("2019-10-09 16:37:31.071"),
                    637062358492290000L
            ),
            new QuestionCristianNtp(
                    2,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 134, 160, 117, 232, 159, 255,
                        229, 238, 135, 129, 138, 32, 71, 255,
                        229, 238, 136, 147, 27, 130, 87, 255
                    },
                    DateUtil.parse("2022-03-30 14:34:56.460"),
                    DateUtil.parse("2022-03-30 14:38:41.539"),
                    DateUtil.parse("2022-03-30 14:43:15.107"),
                    DateUtil.parse("2022-03-30 14:47:56.278"),
                    -280461481,
                    DateUtil.parse("2022-03-30 14:47:28.232"),
                    637842484762782962L
            ), new QuestionCristianNtp(
                    3,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 205, 244, 215, 255,
                        229, 238, 143, 146, 1, 170, 15, 255,
                        229, 238, 144, 234, 59, 103, 15, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.804"),
                    DateUtil.parse("2022-03-30 15:13:06.006"),
                    DateUtil.parse("2022-03-30 15:18:50.232"),
                    DateUtil.parse("2022-03-30 15:24:02.997"),
                    2181525,
                    DateUtil.parse("2022-03-30 15:24:03.215"),
                    637842506429976951L
            ),
            new QuestionCristianNtp(
                    4,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 209, 244, 191, 255,
                        229, 238, 142, 148, 178, 154, 47, 255,
                        229, 238, 143, 85, 75, 237, 95, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.820"),
                    DateUtil.parse("2022-03-30 15:08:52.697"),
                    DateUtil.parse("2022-03-30 15:12:05.296"),
                    DateUtil.parse("2022-03-30 15:14:42.200"),
                    -485139829,
                    DateUtil.parse("2022-03-30 15:13:53.686"),
                    637842500822009657L
            ),
            new QuestionCristianNtp(
                    5,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 209, 244, 191, 255,
                        229, 238, 143, 92, 222, 18, 191, 255,
                        229, 238, 144, 177, 5, 178, 7, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.820"),
                    DateUtil.parse("2022-03-30 15:12:12.867"),
                    DateUtil.parse("2022-03-30 15:17:53.022"),
                    DateUtil.parse("2022-03-30 15:23:30.036"),
                    -384835343,
                    DateUtil.parse("2022-03-30 15:22:51.552"),
                    637842506100360685L
            ),
            new QuestionCristianNtp(
                    6,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 213, 244, 159, 255,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 143, 85, 35, 244, 207, 255,
                        229, 238, 143, 87, 170, 202, 39, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.835"),
                    DateUtil.parse("2022-03-30 15:12:05.140"),
                    DateUtil.parse("2022-03-30 15:12:07.667"),
                    DateUtil.parse("2022-03-30 15:16:28.958"),
                    -44934171,
                    DateUtil.parse("2022-03-30 15:16:24.465"),
                    637842501889588341L
            ),
            new QuestionCristianNtp(
                    7,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 221, 244, 167, 255,
                        229, 238, 143, 62, 102, 26, 39, 255,
                        229, 238, 143, 93, 201, 224, 95, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.867"),
                    DateUtil.parse("2022-03-30 15:11:42.398"),
                    DateUtil.parse("2022-03-30 15:12:13.788"),
                    DateUtil.parse("2022-03-30 15:13:48.785"),
                    672667885,
                    DateUtil.parse("2022-03-30 15:14:56.052"),
                    637842500287854231L
            ),
            new QuestionCristianNtp(
                    8,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 225, 244, 95, 255,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 143, 193, 67, 152, 71, 255,
                        229, 238, 143, 246, 12, 59, 87, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.882"),
                    DateUtil.parse("2022-03-30 15:13:53.264"),
                    DateUtil.parse("2022-03-30 15:14:46.047"),
                    DateUtil.parse("2022-03-30 15:18:20.421"),
                    730037844,
                    DateUtil.parse("2022-03-30 15:19:33.425"),
                    637842503004214312L
            ),
            new QuestionCristianNtp(
                    9,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 233, 244, 63, 255,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 143, 73, 228, 49, 175, 255,
                        229, 238, 143, 241, 175, 152, 31, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.913"),
                    DateUtil.parse("2022-03-30 15:11:53.891"),
                    DateUtil.parse("2022-03-30 15:14:41.685"),
                    DateUtil.parse("2022-03-30 15:19:08.797"),
                    -130671623,
                    DateUtil.parse("2022-03-30 15:18:55.730"),
                    637842503487973246L
            ),
            new QuestionCristianNtp(
                    10,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 237, 244, 47, 255,
                        229, 238, 143, 35, 23, 190, 239, 255,
                        229, 238, 143, 73, 8, 109, 191, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.929"),
                    DateUtil.parse("2022-03-30 15:11:15.092"),
                    DateUtil.parse("2022-03-30 15:11:53.032"),
                    DateUtil.parse("2022-03-30 15:16:28.117"),
                    -364614035,
                    DateUtil.parse("2022-03-30 15:15:51.656"),
                    637842501881178070L
            ),
            new QuestionCristianNtp(
                    11,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 248, 87, 199, 255,
                        229, 238, 142, 212, 104, 240, 23, 255,
                        229, 238, 143, 192, 82, 184, 111, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.970"),
                    DateUtil.parse("2022-03-30 15:09:56.409"),
                    DateUtil.parse("2022-03-30 15:13:52.323"),
                    DateUtil.parse("2022-03-30 15:20:03.978"),
                    -1241082933,
                    DateUtil.parse("2022-03-30 15:17:59.870"),
                    637842504039785865L
            ),
            new QuestionCristianNtp(
                    12,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 88, 252, 87, 239, 255,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 113, 203, 9, 175, 255,
                        229, 238, 143, 78, 18, 222, 7, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:52.985"),
                    DateUtil.parse("2022-03-30 15:08:17.793"),
                    DateUtil.parse("2022-03-30 15:11:58.073"),
                    DateUtil.parse("2022-03-30 15:18:51.968"),
                    -1945437737,
                    DateUtil.parse("2022-03-30 15:15:37.424"),
                    637842503319685474L
            ),
            new QuestionCristianNtp(
                    13,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 0, 87, 191, 255,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 143, 43, 95, 247, 47, 255,
                        229, 238, 143, 107, 225, 46, 103, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.001"),
                    DateUtil.parse("2022-03-30 15:11:23.374"),
                    DateUtil.parse("2022-03-30 15:12:27.879"),
                    DateUtil.parse("2022-03-30 15:17:56.937"),
                    -593428253,
                    DateUtil.parse("2022-03-30 15:16:57.594"),
                    637842502769376506L
            ),
            new QuestionCristianNtp(
                    14,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 4, 87, 151, 255,
                        229, 238, 143, 119, 78, 9, 79, 255,
                        229, 238, 144, 42, 91, 77, 255, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.016"),
                    DateUtil.parse("2022-03-30 15:12:39.304"),
                    DateUtil.parse("2022-03-30 15:15:38.356"),
                    DateUtil.parse("2022-03-30 15:22:22.040"),
                    -586980876,
                    DateUtil.parse("2022-03-30 15:21:23.342"),
                    637842505420401751L
            ),
            new QuestionCristianNtp(
                    15,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 12, 87, 111, 255,
                        229, 238, 143, 155, 50, 101, 247, 255,
                        229, 238, 143, 158, 79, 210, 239, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.048"),
                    DateUtil.parse("2022-03-30 15:13:15.196"),
                    DateUtil.parse("2022-03-30 15:13:18.311"),
                    DateUtil.parse("2022-03-30 15:19:02.793"),
                    -111670137,
                    DateUtil.parse("2022-03-30 15:18:51.626"),
                    637842503427930274L
            ),
            new QuestionCristianNtp(
                    16,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 12, 87, 111, 255,
                        229, 238, 142, 234, 19, 136, 7, 255,
                        229, 238, 143, 57, 228, 153, 127, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.048"),
                    DateUtil.parse("2022-03-30 15:10:18.076"),
                    DateUtil.parse("2022-03-30 15:11:37.892"),
                    DateUtil.parse("2022-03-30 15:13:14.360"),
                    242798182,
                    DateUtil.parse("2022-03-30 15:13:38.640"),
                    637842499943603636L
            ),
            new QuestionCristianNtp(
                    17,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 28, 87, 23, 255,
                        229, 238, 143, 87, 106, 180, 55, 255,
                        229, 238, 144, 87, 36, 168, 135, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.110"),
                    DateUtil.parse("2022-03-30 15:12:07.416"),
                    DateUtil.parse("2022-03-30 15:16:23.143"),
                    DateUtil.parse("2022-03-30 15:20:52.390"),
                    -74705629,
                    DateUtil.parse("2022-03-30 15:20:44.919"),
                    637842504523901257L
            ),
            new QuestionCristianNtp(
                    18,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 36, 86, 255, 255,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 143, 251, 201, 173, 143, 255,
                        229, 238, 144, 210, 90, 246, 7, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.141"),
                    DateUtil.parse("2022-03-30 15:14:51.787"),
                    DateUtil.parse("2022-03-30 15:18:26.355"),
                    DateUtil.parse("2022-03-30 15:21:42.989"),
                    1110055096,
                    DateUtil.parse("2022-03-30 15:23:33.995"),
                    637842505029899809L
            ),
            new QuestionCristianNtp(
                    19,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 44, 86, 207, 255,
                        229, 238, 143, 31, 33, 92, 247, 255,
                        229, 238, 143, 152, 62, 202, 7, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.173"),
                    DateUtil.parse("2022-03-30 15:11:11.130"),
                    DateUtil.parse("2022-03-30 15:13:12.245"),
                    DateUtil.parse("2022-03-30 15:15:02.095"),
                    440534608,
                    DateUtil.parse("2022-03-30 15:15:46.148"),
                    637842501020950784L
            ),
            new QuestionCristianNtp(
                    20,
                    new short[]{
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        0, 0, 0, 0, 0, 0, 0, 0,
                        229, 238, 142, 89, 48, 86, 191, 255,
                        229, 238, 143, 223, 149, 97, 223, 255,
                        229, 238, 143, 241, 254, 237, 55, 255
                    },
                    DateUtil.parse("2022-03-30 15:07:53.188"),
                    DateUtil.parse("2022-03-30 15:14:23.583"),
                    DateUtil.parse("2022-03-30 15:14:41.995"),
                    DateUtil.parse("2022-03-30 15:20:08.074"),
                    321578902,
                    DateUtil.parse("2022-03-30 15:20:40.232"),
                    637842504080742197L
            )
    ));

    public static List<QuestionCristianNtp> getQuestionCristianNtps() {
        return questionCristianNtps;
    }

    public static QuestionCristianNtp getQuestionCristianNtpByQuestionId(long questionId) {
        for (QuestionCristianNtp questionCristianNtp : questionCristianNtps) {
            if (questionCristianNtp.getQuestionId() == questionId) {
                return questionCristianNtp;
            }
        }

        return null;
    }

    public long getQuestionId() {
        return questionId;
    }

    public short[] getNtpMesage() {
        short[] arr = new short[ntpMesage.length];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = (short) Byte.toUnsignedInt(ntpMesage[i]);
        }
        return arr;
    }

    public byte[] getNtpMesageByte() {
        return ntpMesage;
    }

    public long getDifferentTicks() {
        return differentTicks;
    }

    public String getOriginateSendTimestamp() {
        return DateUtil.getDateTimeStringFormat(originateSendTimestamp);
    }

    public String getReceiveTimestamp() {
        return DateUtil.getDateTimeStringFormat(receiveTimestamp);
    }

    public String getTransmitTimestamp() {
        return DateUtil.getDateTimeStringFormat(transmitTimestamp);
    }

    public String getOriginateReceiveTime() {
        return DateUtil.getDateTimeStringFormat(originateReceiveTime);
    }

    public String getDateTimeAfterSynchronize() {
        return DateUtil.getDateTimeStringFormat(dateTimeAfterSynchronize);
    }

    public Date getOriginateSendTimestampDate() {
        return originateSendTimestamp;
    }

    public Date getReceiveTimestampDate() {
        return receiveTimestamp;
    }

    public Date getTransmitTimestampDate() {
        return transmitTimestamp;
    }

    public Date getOriginateReceiveTimeDate() {
        return originateReceiveTime;
    }

    public Date getDateTimeAfterSynchronizeDate() {
        return dateTimeAfterSynchronize;
    }

    public long getOriginateTimeUtcTick() {
        return originateTimeUtcTick;
    }
}


/*

Code sinh ra đề bài (C#)

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static Random random = new Random();

        static void Main(string[] args)
        {
            for(int i = 3; i <= 100; i++)
            {
                DateTime t1 = DateTime.Now;
                DateTime t2 = t1.AddTicks(LongRandom(UInt32.MinValue, UInt32.MaxValue));
                DateTime t3 = new DateTime(t2.Ticks + LongRandom(UInt32.MinValue, UInt32.MaxValue));
                DateTime t4 = new DateTime(t3.Ticks + LongRandom(UInt32.MinValue, UInt32.MaxValue));

                byte[] ntpMessage = CreateNtpMessage(t1, t2, t3);
                ShowWithConvertFunction(i, ntpMessage, t4);
            }

            Console.ReadKey();
        }



        static byte[] CreateNtpMessage(DateTime t1, DateTime t2, DateTime t3)
        {
            byte[] ntpMessage = new byte[48];

            // T1
            // Vì T1 có thể ở vị trí 16 hoặc 24 => Sẽ random hai vị trí này
            byte[] t1_bytes = CreateTimeInNtpMessage(t1);
            int[] arrayPosition = new int[] { 16, 24 };
            int position = arrayPosition[LongRandom(0, 2)];
            Array.Copy(t1_bytes, 0, ntpMessage, position, 8);

            // T2
            byte[] t2_bytes = CreateTimeInNtpMessage(t2);
            Array.Copy(t2_bytes, 0, ntpMessage, 32, 8);

            // T3
            byte[] t3_bytes = CreateTimeInNtpMessage(t3);
            Array.Copy(t3_bytes, 0, ntpMessage, 40, 8);

            return ntpMessage;
        }

        static byte[] CreateTimeInNtpMessage(DateTime time)
        {
            byte[] bytes = new byte[8];

            DateTime origin = new DateTime(1900, 1, 1, 7, 0, 0);
            double offset = time.Subtract(origin).TotalSeconds;
            ulong nguyen = (ulong)offset;
            ulong le = (ulong)((offset - nguyen) * UInt32.MaxValue);

            byte[] nguyen_bytes = BitConverter.GetBytes(nguyen);
            Array.Reverse(nguyen_bytes);
            Array.Copy(nguyen_bytes, 4, bytes, 0, 4);

            byte[] le_bytes = BitConverter.GetBytes(le);
            Array.Reverse(le_bytes);
            Array.Copy(le_bytes, 4, bytes, 4, 4);

            return bytes;
        }

        static long LongRandom(long min, long max) // [min, max)
        {
            byte[] buf = new byte[8];
            random.NextBytes(buf);
            long longRand = BitConverter.ToInt64(buf, 0);
            return (Math.Abs(longRand % (max - min)) + min);
        }

        static void ShowWithConvertFunction(int id, byte[] Data, DateTime T4)
        {
            String FormatDateTime = "yyyy-MM-dd HH:mm:ss.fff";

            DateTime T1;
            if (BitConverter.ToInt32(Data, 16) != 0)
                T1 = Convert(Data, 16);
            else
                T1 = Convert(Data, 24);

            DateTime T2 = Convert(Data, 32);
            DateTime T3 = Convert(Data, 40);

            long Theta = (long)Math.Round(((T2.Ticks - T1.Ticks) + (T3.Ticks - T4.Ticks)) / 2.0, 0, MidpointRounding.AwayFromZero);
            DateTime Final = T4.AddTicks(Theta);

            Console.WriteLine(", new QuestionCristianNtp(");
            Console.WriteLine($"\t{id},");
            Console.WriteLine("\tnew short[]{");
            for (int i = 0; i < Data.Length; i++)
            {
                if (i % 8 == 0)
                    Console.Write("\t\t");

                if (i != Data.Length - 1)
                    Console.Write($"{Data[i]}, ");
                else
                    Console.Write($"{Data[i]}");

                if ((i + 1) % 8 == 0)
                    Console.WriteLine("");
            }
            Console.WriteLine("\t},");
            Console.WriteLine($"\tDateUtil.parse(\"{T1.ToString(FormatDateTime)}\"),");
            Console.WriteLine($"\tDateUtil.parse(\"{T2.ToString(FormatDateTime)}\"),");
            Console.WriteLine($"\tDateUtil.parse(\"{T3.ToString(FormatDateTime)}\"),");
            Console.WriteLine($"\tDateUtil.parse(\"{T4.ToString(FormatDateTime)}\"),");
            Console.WriteLine($"\t{Theta},");
            Console.WriteLine($"\tDateUtil.parse(\"{Final.ToString(FormatDateTime)}\"),");
            Console.WriteLine($"\t{T4.Ticks}L");
            Console.WriteLine(")");
        }

        // Từ byte convert ra DateTime
        static DateTime Convert(byte[] Data, int Position)
        {
            DateTime ReturnValue = new DateTime(1900, 1, 1, 7, 0, 0);
            ulong Nguyen = 0, Le = 0;

            for (int i = 0; i < 4; i++)
            {
                Nguyen += (ulong)Data[Position + i] << (8 * (3 - i));
                Le += (ulong)Data[Position + 4 + i] << (8 * (3 - i));
            }

            return ReturnValue.AddMilliseconds(Nguyen * 1000 + Le * 1000 / UInt32.MaxValue);
        }
    }
}

*/
